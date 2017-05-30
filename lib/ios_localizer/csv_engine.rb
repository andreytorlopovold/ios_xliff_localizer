# encoding: utf-8

require 'csv'
require 'xliffer'

module IOSLocalizer

  class CSVEngine

    def self.analyse_csv path
      dictionary = CSV.read(path, encoding: "UTF-8")
      puts "Avaliable keys: #{dictionary.first.join(',')}"
      count = dictionary.first.count
      dictionary.each {|e| puts "Check your CSV file. It's not correct! Some rows have different element count. " unless e.count == count }
    end

    def self.convert *params

      if params.count != 4
        puts "Not enought params!"
        return
      end

      xliff_file = params[0]
      csv_file   = params[1]
      source_key = params[2]
      target_key = params[3]

      failed_keys = []
      dictionary = CSV.read(csv_file, encoding: "UTF-8")
      source_index = dictionary.first.index(source_key)
      target_index = dictionary.first.index(target_key)

      xliff = XLIFFer::XLIFF.new(File.open(xliff_file))
      xliff.files.each { |file| file.target_language ||= "en" }

      puts "-"*100
      puts "Proccessing..."
      xliff.files.each do |file|
        puts "file: #{file.original} is processed!"
        file.strings.each do |string|
          next if string.source.empty?

          unconverted_hash = {:file => file.original, :id => string.id, :source => string.source.to_s}
          dictionary.each do |row|
            if row[source_index] == string.source
              string.source = row[target_index]
              unconverted_hash = nil
              break
            end
            if string.source == row[target_index] || string.id == row[target_index]
              unconverted_hash = nil
              break
            end
          end
          failed_keys.push(unconverted_hash) unless unconverted_hash == nil
        end
      end
      puts "Done!"
      puts "-"*100
      puts "\n"
      puts "Failed keys count: #{failed_keys.count}\n"
      array_for_output = failed_keys.map do |row|
        row.values
      end
      array_for_output.insert(0,["file","UI element ID","UI element text"])
      File.open("#{File.dirname(csv_file)}/failed_keys_#{target_key}.csv", "w") { |f| f.write(array_for_output.inject([]) { |csv, row|  csv << CSV.generate_line(row) }.join("")) }
      puts "Failed keys write into file failed_keys_#{target_key}.csv\n\n"
      puts "\n\n"
      puts "xliff-file saved"
      File.open("#{File.dirname(xliff_file)}/output_xliff_#{target_key}.xliff", "w") {|f| f.write(xliff.to_s) }
    end
  end
end
