# IOS localizer

**First of all, it's my first work. And if you find bugs write me, please! :)**

Localizer for ios application. Create xliff-file to import in your project with translate values from dictionary (csv).<br><br>
**Warning! If xliff file don't have target language, it will convert into english target language.**

# Install

```bash
gem install ios_xliff_localizer
```

# How it use

* For help, just execute `ios_xliff_localizer` in terminal.
* For inspect your .csv file execute:  `ios_xliff_localizer your_csv_file`
* For convert your file execute:  `ios_xliff_localizer xliff_file csv_file SOURCE_FIELD TARGET_FIELD`

## Examples
You have file `dictionary.csv` with 5 fields: `android_keys`, `ios_keys`, `en`, `ru`, `fr`.
In this directory you write keys which you use in your project and translated keys in other language.
For example, look at the table 1.

*Table 1.*
|android_keys|ios_keys|en|ru|
|-|-|-|-|
|cancel_key|cancel|Cancel|Отмена|
|download_key|download|Download|Скачать|
|etc...|etc...|etc...|etc...|

And you need convert `ios_keys` into russian language (key `ru`) in your `en.xliff` file.
<br>Your command will be:<br>
```bash
ios_xliff_localizer en.xliff dictionary.csv ios_keys ru
```
<br>Description:
* ios_xliff_localizer        - gem name
* en.xliff             - path to your .xliff file
* dictionary.csv       - path to your .csv file
* ios_keys             - source field. Field in dictionary which tool will use to find in xliff file
* ru                   - target field. Field in dictionary which tool will use to set in xliff file

After processing tool create ` en.xliff ` with postfix `out` (`en_out.xliff`) which you can import in your ios project in xCode.
<br>Failed keys will write into special file. `failed_keys_[TARGET_FIELD].csv`. In our example it will be `failed_keys_en.csv`

# Contacts

email: torlopov.andrey@gmail.com </br>
skype: torlopov.andrey
