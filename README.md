Eiffel_Android
==============

A library to use the Android API from Eiffel.

Note: This library is an attempt to use the Android API from Eiffel. It is not
working at the moment and if we succeeded to make it work, there is lots of
work to be done before having a usable library.

Installation
------------

First, you need to compile a EiffelStudio that target an Android machine.
See: https://github.com/tioui/Eiffel_Spec/tree/master/android-spec .

Download the current repository. and put it some place.

Compilation and execution of the test example
---------------------------------------------

First, you need to "Finalize" the system in the "test_eiffel" directory.

When the compilation is done, go to the "test_eiffel/EIFGENs/android_test/F_code"
directory and compile the Eiffel project static library.

```bash
cd test_eiffel/EIFGENs/android_test/F_code
make cecil
```

This will create a "libandroid_test.a" file. Rename this file "libapp.a" and 
move it in the "library/Clib" file in the root of the repository.

```bash
mv libandroid_test.a ../../../../library/Clib/libapp.a
```

Now, go in this directory. and compile the C shared library "libapp.so" that
the Java Virtual Machine will use (you must have the EiffelStudio Android bin library in the PATH).

```bash
cd ../../../../library/Clib/
export ISE_EIFFEL=/usr/local/Eiffel_13.11
export ISE_PLATFORM=android-9-arm
export PATH=$PATH:$ISE_EIFFEL/studio/spec/$ISE_PLATFORM/bin
finish_freezing -library
```

Now, move the shared library in the Android Project.

```bash
mv ../spec/android-9-arm/lib/libapp.so ../../Test_Android/libs/armeabi/
```

Now create the APK of the "Test_Android" Android project (You can do that in 
eclipse with ADT). 

Note: When you launch this application on an Android machine, it does not work.
That is what I have to do next :(
