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
I just ended up inserting this 

####4. 


*This text will be italic*
**This text will be bold**

**Everyone _must_ attend the meeting at 5 o'clock today.**


On July 3, the Black Knights, a squadron of Marine Corps F/A-18 Hornets, participated in an assault on a destroyer near the city of Los Angeles.

