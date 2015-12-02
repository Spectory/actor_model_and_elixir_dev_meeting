
#Debugging
<img src="./cockroaches.jpg" alt="Drawing" width="250" />

Much of your time as a computer programmer will likely be spent debugging. There is no text book answer on 'how to debug', but hopefully you'll find those guidelines helpful.

===

####Get your facts right!
<img src="./brainy.jpg" alt="Drawing" width="150" align="right" />
 - The computer is not trying to mislead you. The clue to what is wrong in your code is in the values of your variables and the flow of control. Try to see what the facts are pointing to.
 - Intuition and hunches are great, but when a hunch and a fact collide, the fact wins.

---

####K.I.S.S
<img src="./kiss.jpg" alt="Drawing" width="200" align="right" />
 - Don't look for complex explanations.
 - Start with the simple things that are easy to check & rule them out.
 - Use your intuition, check the code you suspect the most first. Good instincts will come with
experience.

---

####Its not me, its YOU.
<img src="./bug.jpg" alt="Drawing" width="100"align="right" />
 - The bug is not moving around in your code, trying to trick or evade you. It is just sitting in one place, doing the wrong thing in the same way every time.
 - If you code was working a minute ago, but now it doesn't - what was the last thing you changed?
 - Check version control to check latest changes to the code base
 - Check DB changes
 - If the code is has not changed, did anything special happened lately. for example date changes such as time zone change, new year, new month...

---

#### We are all going to DIE!!!
<img src="./courage.jpg" alt="Drawing" width="100"align="right" />
 - Don't panic.
 - Do not change your code haphazardly trying to track down a bug.
 - This is sort of like a scientist who changes more than one variable in an experiment at a time.

---

#### I was just in the neighborhood...
<img src="./johny.jpg" alt="Drawing" width="150"align="right" />
 - If you find some wrong code that does not seem to be related to the bug you we're tracking, fix it anyway. Maybe its related in some obscured way.
 - most of the times, you'll just kill 2 bugs in one stone.

---

#### Elementary, my dear Watson
<img src="./sherlok.jpg" alt="Drawing" width="100"align="right" />
 - You should be able to explain in Sherlock Holmes style the series of facts, tests, and deductions that led you to your consultation.
 - We're engineers, not magicians. There are no bunnies in our hats.
 - We need to report to someone, i.e. bosses ("what happened?"), clients ("Why am I paying you guys?"), consumers ("Doesn't work on LG3! Worst app ever!!!")...
 - You should be able to say
   - The bug is HERE, I'll show you.
   - The bug is not HERE, I'll prove that to you.

---

#### Everybody poops
<img src="./poop.jpg" alt="Drawing" width="100"align="right" />
 - Bugs are in the nature of coding. We all do it. That's life.
 - Don't look for someone to blame.
 - Be critical about your own code.
 - Any peace of code is the potential bug until proven otherwise.
 - Vendors & external libs have bugs too.

---

#### You are not alone
<img src="./island.jpg" alt="Drawing" width="150"align="right" />
 - Don't be shy. We're all in it together, just ask around.
 - Asking the right question is as important as finding right answer.
 - Often explaining the problem to someone else makes it clearer to you.
 - When presenting the bug to some else, don't explain what you did/changed so far. Explain what is problem right NOW, and let him do his own thinking.
 - Different people - Different views.
 - Double the people - Double the experience.

---

#### Well, we're not in Kansas any more...
<img src="./oz.jpeg" alt="Drawing" width="225"align="right" />
 - Debugging code is more mentally demanding than writing code.
 - The longer you try to track down a bug without success, the less perspective you tend to have.
 - Realize when you have lost the perspective on your code to debug
 - Ask yourself - Do I remember what brought me to THIS piece of code?
 - Take a break. Get some sleep.


