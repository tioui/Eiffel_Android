Compillation
============

 * Finalize the projet with EiffelStudio (Android-9-arm spec)
 * Move the generated .so file from the EIFGENs directory to the Android library directory

```bash
mv eiffel/EIFGENs/java-example/F_code/java-example.so Android/jni/libexample.so
```

 * Compile the C glue code

```bash
cd Android/jni
/opt/android-ndk/toolchains/arm-linux-androideabi-4.6/prebuilt/linux-x86_64/bin/arm-linux-androideabi-gcc -shared -o libtest.so test.c -lexample -L. -I/usr/local/Eiffel_14.05/studio/spec/android-9-arm/include -I/opt/android-ndk/platforms/android-9/arch-arm/usr/include/ -L/opt/android-ndk/platforms/android-9/arch-arm/usr/lib/ -Wall -fpic -lc -nostdlib
mkdir ../libs/armeabi/
mv libtest.so ../libs/armeabi/
mv libexample.so ../libs/armeabi/
```

 * With Eclipse or with the command line tools of the Android SDK (you will need the android-support-v7-appcompat library project in your eclipse), build the Android package and test it.

[<img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif">](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=louis%40tioui%2ecom&lc=CA&item_name=Louis%20Marchand&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted)
[<img src="https://www.coinbase.com/assets/buttons/donation_small-5dab7534cbb87a4ff2b44e469351ec86.png">](https://www.coinbase.com/tioui)

