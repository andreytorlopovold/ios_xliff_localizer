require_relative 'ios_xliff_localizer/csv_engine.rb'

module IOSXliffLocalizer

  VERSION = "0.1.2"

  def self.help
    puts "ios_xliff_localizer v.#{VERSION}"
    puts "Localizer for ios application. Create xliff-file to import in your project with translate values from dictionary (csv)"
    puts "\n"
    puts "Warning! If xliff file don't have target language, it will convert into english target language."
    puts "\n"
    puts "Usage:"
    puts "  For inspect your .csv file execute: \n  ios_xliff_localizer csv_file\n\n"
    puts "  For convert your file execute: \n  ios_xliff_localizer xliff_file csv_file SOURCE_FIELD TARGET_FIELD"
    puts "\n"
    puts "Examples:"
    puts "  You have file (dictionary.csv) with 5 fields: android, ios, en, ru, fr"
    puts "  And you need convert ios into russian language\n\n"
    puts "  Your command will be:"
    puts "  ios_xliff_localizer xliff_file_name dictionary_file_name ios ru\n\n"
    puts "  Description:"
    puts "    ios_xliff_localizer  - gem name"
    puts "    xliff_file_name      - path to your .xliff file"
    puts "    dictionary_file_name - path to your .csv file"
    puts "    ios                  - source field. Field in dictionary which tool will use to find in xliff file"
    puts "    ru                   - target field. Field in dictionary which tool will use to set in xliff file"
    puts "\n"
    puts "  After processing tool create xliff_file_name with postfix 'out'\n  which you can import in your ios project in xCode"
    puts "\n"
    puts "  Failed keys will write into special file. failed_keys_[TARGET_FIELD].cvs"
  end

  def self.analyse_csv path
    CSVEngine.analyse_csv path
  end

  def self.convert *args
    if args.count < 4
      puts "Not enought params!\n\n"
      IOSXliffLocalizer::help
      return
    end
    CSVEngine.convert args[0], args[1], args[2], args[3]
  end
end
