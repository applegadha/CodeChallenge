# CodeChallenge

<p> You are planning a big programming conference and have received many proposals which have passed the initial screen process but you're having trouble fitting them into the time constraints of the day -- there are so many possibilities! So you write a program to do it for you.</p>

<ul>
<li> The conference has multiple tracks each of which has a morning and afternoon session. </li>
<li> Each session contains multiple talks. </li>
<li> Morning sessions begin at 9am and must finish by 12 noon, for lunch. </li>
<li> Afternoon sessions begin at 1pm and must finish in time for the networking event. </li>
<li> The networking event can start no earlier than 4:00 and no later than 5:00. </li>
<li> No talk title has numbers in it. </li>
<li> All talk lengths are either in minutes (not hours) or lightning (5 minutes). </li>
<li> Presenters will be very punctual; there needs to be no gap between sessions.</li>
</ul>
Note that depending on how you choose to complete this problem, your solution may give a different ordering or combination of talks into tracks. This is acceptable; you don’t need to exactly duplicate the sample output given here.

<h3>Test input</h3>
<ul>
<li>Writing Fast Tests Against Enterprise Rails -  60min 
<li>Overdoing it in Python -  45min 
<li>Lua for the Masses -  30min 
<li>Ruby Errors from Mismatched Gem Versions - 45min 
<li>Common Ruby Errors - 45min 
<li>Rails for Python Developers lightning 
<li>Communicating Over Distance 60min 
<li>Accounting-Driven Development - 45min 
<li>Woah - 30min 
<li>Sit Down and Write - 30min 
<li>Pair Programming vs Noise - 45min 
<li>Rails Magic - 60min 
<li>Ruby on Rails: Why We Should Move On - 60min 
<li>Clojure Ate Scala (on my project) - 45min 
<li>Programming in the Boondocks of Seattle - 30min 
<li>Ruby vs. Clojure for Back-End Development - 30min 
<li>Ruby on Rails Legacy App Maintenance - 60min 
<li>A World Without HackerNews - 30min 
<li>User Interface CSS in Rails Apps - 30min
</ul>

<h3>Sample output: 
  Track 1:</h3>
 <ul>
<li>09:00AM Writing Fast Tests Against Enterprise Rails 60min 
<li>10:00AM Overdoing it in Python 45min 
<li>10:45AM Lua for the Masses 30min 
<li>11:15AM Ruby Errors from Mismatched Gem Versions 45min 
<li>12:00PM Lunch 
<li>01:00PM Ruby on Rails: Why We Should Move On 60min 
<li>02:00PM Common Ruby Errors 45min 
<li>02:45PM Pair Programming vs Noise 45min 
<li>03:30PM Programming in the Boondocks of Seattle 30min 
<li>04:00PM Ruby vs. Clojure for Back-End Development 30min 
<li>04:30PM User Interface CSS in Rails Apps 30min 
<li>05:00PM Networking Event
</ul>
<h3>Track 2:</h3>
<ul>
<li>09:00AM Communicating Over Distance 60min 
<li>10:00AM Rails Magic 60min 
<li>11:00AM Woah 30min 
<li>11:30AM Sit Down and Write 30min 
<li>12:00PM Lunch 
<li>01:00PM Accounting-Driven Development 45min 
<li>01:45PM Clojure Ate Scala (on my project) 45min 
<li>02:30PM A World Without HackerNews 30min 
<li>03:00PM Ruby on Rails Legacy App Maintenance 60min 
<li>04:00PM Rails for Python Developers lightning 
<li>05:00PM Networking Event
</ul>


<h3> Solution: To test the code, run and enter the text with talk details. Enter two blank lines to denote end of input text. </h3>

