Gem::Specification.new do |spec|
  spec.name          = 'ios_xliff_localizer'
  spec.version       = '0.1.2'
  spec.date          = '2017-05-30'
  spec.summary       = "Localizer for xCode projects. Localize .xliff by mapping xliff and cvs dictionary."
  spec.description   = "Localizer for xCode projects. Localize .xliff by mapping xliff and cvs dictionary."
  spec.authors       = [ "Andrey Torlopov" ]
  spec.email         = 'torlopov.andrey@gmail.com'
  spec.homepage      = 'https://github.com/Torlopov-Andrey/ios_xliff_localizer.git'
  spec.license       = 'MIT'

  spec.files         = [
    "lib/ios_xliff_localizer.rb",
    "lib/ios_xliff_localizer/csv_engine.rb"
  ]

  spec.add_runtime_dependency "xliffer",
    [">= 0"]
  spec.add_development_dependency "xliffer",
    [">= 0"]
  
  spec.requirements = %w[]
  spec.executables.push 'ios_xliff_localizer'
end
