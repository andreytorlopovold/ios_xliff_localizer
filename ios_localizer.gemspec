Gem::Specification.new do |spec|
  spec.name          = 'ios_localizer'
  spec.version       = '0.1.0'
  spec.date          = '2017-05-30'
  spec.summary       = "Localizer for xCode projects. Localize .xliff by mapping xliff and cvs dictionary."
  spec.description   = "Localizer for xCode projects. Localize .xliff by mapping xliff and cvs dictionary."
  spec.authors       = [ "Andrey Torlopov" ]
  spec.email         = 'torlopov.andrey@gmail.com'
  spec.homepage      = 'https://github.com/Torlopov-Andrey/ios_localizer.git'
  spec.license       = 'MIT'

  spec.files         = [
    "lib/ios_localizer.rb",
    "lib/ios_localizer/csv_engine.rb"
  ]
  spec.requirements = %w[]
  spec.executables.push 'ios_localizer'
end
