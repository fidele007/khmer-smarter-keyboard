# Khmer Smarter Keyboard

Khmer Smarter Keyboard ជា Tweak សម្រាប់​ Jailbroken iOS ដែល​សរសេរ​កូដ​បញ្ចូល/បន្ថែម​ក្នុង​កម្មវិធី [Khmer Smart Keyboard](https://appsto.re/us/JW1x3.i) ។

គម្រោង​នេះ​ធ្វើ​ឡើង​ដើម្បី​វិវត្ត​កម្មវិធី Khmer Smart Keyboard ដែល​កំពុង​ទទួល​បាន​ការ​និយម​ប្រើ​ប្រាស់​ពី​សំណាក់​ប្រជាជន​ខ្មែរ ឲ្យ​កាន់​តែ​មាន​ភាព​ល្អ​ប្រសើរ​ជាង​មុន​ទៅ​ទៀត ។ ខ្ញុំ​បើក​គម្រោង​នេះ​ឡើង​ដោយ​ផ្ទាល់​ខ្លួន និង​ដោយ​គ្មាន​ការ​ជាប់​ពាក់​ព័ន្ធ​នឹង​ [ALIEN DEV CO.,LTD](http://alien-dev.com) ដែល​ជា​ស្ថាបនិក​ក្ដារ​ចុច​ឆ្លាត​វៃ​ឡើយ ។

លក្ខណៈ​ពិសេស (Feature) បច្ចុប្បន្នរបស់​គម្រោង​នេះ​មាន​ដូច​តទៅ ៖
* ធ្វើ​ឲ្យ​ជម្រើស «ប្រើចន្លោះមិនឃើញ» (U+200B) (ដែល​មាន​ស្រាប់​ក្នុង​ **កំណត់ការប្រើប្រាស់** របស់​កម្មវិធី​តែ​មិន​ដំណើរ​ការ) ដំណើរ​ការឡើង​វិញ ។
* ផ្លាស់​ទី​ទស្សន៍ទ្រនិច (Cursor) ដោយ​អូស​លើ​ប៊ូតុង​ដក​ឃ្លា ។ ចំណាំ៖ នេះ​នឹង​លុប​លើ​ការ​ផ្លាស់​ប្ដូរ​ក្ដារ​ចុច​ទៅ​អង់គ្លេស/ខ្មែរ​ដោយ​អូស​លើ​ប៊ូតុង​ដក​ឃ្លា ដូច្នេះ​ខ្ញុំ​បាន​ប្ដូរ​ការ​ផ្លាស់​ប្ដូរ​ក្ដារចុច​ដោយ *​ចុច​ឲ្យ​ជាប់​* លើ​ប៊ូតុង​ដក​ឃ្លា​វិញ ។
* ប្រើ​ពណ៌​ផ្សេង​សម្រាប់​ក្ដារ​ចុច ៖ ជម្រើស​នេះ​ធ្វើ​ឲ្យ​អ្នក​អាច​ដាក់​ពណ៌​លើ​ក្ដារ​ចុច​ដោយ​សេរី លើស​ពី​ពណ៌​ទាំង​បួន​ដែល​មក​ស្រាប់​ជា​មួយ​កម្មវិធី ។ មាន​ពណ៌​ពីរ​ប្រភេទ គឺ​ពណ៌​សម្រាប់​ផ្ទៃ​ខាង​ក្រោយ​ក្ដារ​ចុច និង​ពណ៌​ខាង​មុខ (ពណ៌​តួ​អក្សរ) ។
* ប្រើ​រូបភាព​ជា​ផ្ទៃ​ខាង​ក្រោយ​របស់​ក្ដារ​ចុច ៖ អ្នក​អាច​ជ្រើសរើស​រូបភាព​ពី​កម្មវិធី ​Photos, កាត់​តម្រឹម​រូបភាព​ឲ្យ​ត្រូវ​នឹង​គ្រោង​ក្ដារចុច និង​ កែ​ពន្លឺ​រូបភាព​ ។

អ្នក​អាច​ប្រើ​ប្រាស់ និង​កែ​កូដ​នេះ (សម្រាប់​ការ​ប្រើ​ប្រាស់​ផ្ទាល់​ខ្លួន) ដោយ​សេរី​ក្រោម​សិទ្ធិបញ្ញា [MIT License](http://choosealicense.com/licenses/mit/)។

កូដ​នេះ​អាច​ Compile បាន​ដោយ​ប្រើ [Theos](https://github.com/theos/theos) ។ សូម​មើល​[ទី​នេះ​](https://github.com/theos/theos/wiki/Installation) សម្រាប់​ការ​ដំឡើង Theos នៅ​លើ​ម៉ាស៊ីន​របស់​អ្នក ។

ឯកសារ Header របស់​កម្មវិធី​ក្ដារចុចឆ្លាតវៃ មាន​នៅ​ក្នុង​ថត ``dumped-headers`` ។

---

Khmer Smarter Keyboard is a tweak for Jailbroken iOS which hooks into [Khmer Smart Keyboard](https://appsto.re/us/JW1x3.i) app and keyboard extension.

This project aims to largely improve the popular Khmer Smart Keyboard with more functionalities and customization. Please note that this is a project project and is not in any way affiliated with [ALIEN DEV CO.,LTD](http://alien-dev.com), the creator of Khmer Smart Keyboard.

List of current features:
* Make the "Zero width space (ZWSP)" (U+200B) option in the app's Settings actually work
* **Space cursor:** allows moving of cursor in the text field by swiping the space button. This feature conflicts with the swipe gesture to switch between internal keyboards (English/Khmer). Therefore, a *long press gesture* to switch between internal keyboards has been implemented to solve the conflict.
* **Keyboard theme:** allows unlimited theming option for the keyboard which greatly improves upon the preset 4 color theme option included with the original app. Two colors can be customized: the background color and the foreground color (character text color) of the keyboard.
* **Keyboard background image:** allows user to pick an image from the Photos app, crop it to the keyboard's frame and adjust its brightness.

This project is under [MIT License](http://choosealicense.com/licenses/mit/).

This project is compiled using [Theos](https://github.com/theos/theos). Read [here](https://github.com/theos/theos/wiki/Installation) for the instructions on how to set up Theos on your machine.

The header files of Khmer Smart Keyboard's app and keyboard are stored in ``dumped-headers`` directory.
