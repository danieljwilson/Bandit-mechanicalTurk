# GETTING STARTED WITH PSITURK
### My Experience (As a Complete Beginner)

####0. Install [Xcode](https://developer.apple.com/xcode/)

You probably have his already, but if not, get it.


####1. Download Anaconda Python Distribution

This is how they describe it:

>Completely free enterprise-ready Python distribution for large-scale data processing, predictive analytics, and scientific computing

The download link is [here](https://store.continuum.io/cshop/anaconda/).

I tried using the preinstalled version of python on my mac and had issues. This installation seemed to solve that.


####2. Get PsiTurk Running
  2. Install PsiTurk
   Follow the [directions](http://psiturk.readthedocs.org/en/latest/install.html) on the PsiTurk site. I would agree with their statement that:

   >The easiest way to install **psiTurk** is via ``pip``.
   
  2. Set Up Amazon Mechanical Turk 
   There are basically two things you need here.
    * An active account at [Amazon Web Services](http://aws.amazon.com/) (you will need your credit card for this).
    * An active requester account at [Mechanical Turk](https://requester.mturk.com/).
   
   The [directions](http://psiturk.readthedocs.org/en/latest/amt_setup.html) on the PsiTurk site walk you through this.

  3. Set up PsiTurk
   Directions are [here](http://psiturk.readthedocs.org/en/latest/psiturk_org_setup.html).

   Remember to update the ``~/.psiturkconfig`` file with BOTH your Amazon credentials and your PsiTurk credentials.

  4. Run PsiTurk Example
   Now you can run the example. Directions on doing that [here](http://psiturk.org/quick_start/).
   

####3. Install [Processing](https://processing.org/)

**Note**: This is required to adapt this particular bandit experiment, as I built it in Processing since my JavaScript skills don't exist (yet). Processing can publish to Javascript, but it definitely makes implementing the project with PsiTurk more cumbersome. If you can work in Javascript, do that.

[Here](http://processingjs.org/articles/jsQuickStart.html) is some info specifically on working with Processing and JavaScript.

In terms of passing information FROM the processing sketch to JavaScript I found [this page](http://processingjs.org/articles/PomaxGuide.html) helpful. Specifically this code:

```javascript
10      function bindJavascript() {
11         var pjs = Processing.getInstanceById('mysketch3');
12         if(pjs!=null) {
13           pjs.bindJavascript(this);
14           bound = true; }
15         if(!bound) setTimeout(bindJavascript, 250);
16       }
17       bindJavascript();
18 
19       function showXYCoordinates(x, y) {
20         document.getElementById('xcoord').value = x;
21         document.getElementById('ycoord').value = y;
22       }
```
I just ended up inserting this into a **script** tag in the **exp.html** file.

####4. Create Database

I experienced a minor nightmare moving from SQLite (which is the default database) to MySQL. However following [these installation instructions](http://blog.brigitte-jellinek.at/2014/10/setting-up-python-mysql-on-mac/) seemed to (mostly) fix things.

The remaining error I got after this was related to the files ``libssl.1.0.0.dylib`` and ``libcrypto.1.0.0.dylib``. Finally I found some info on what to do [here](http://mithun.co/hacks/library-not-loaded-libcrypto-1-0-0-dylib-issue-in-mac/). I couldn't get the command line prompts to work for some reason but just copied the new files to the filepath where they were missing (as per the error message).

**Everyone _must_ attend the meeting at 5 o'clock today.**


On July 3, the Black Knights, a squadron of Marine Corps F/A-18 Hornets, participated in an assault on a destroyer near the city of Los Angeles.

