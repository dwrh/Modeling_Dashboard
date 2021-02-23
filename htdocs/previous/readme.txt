PersonalityQuiz
Version 1.0a
Revisioned by Marc Gottlieb
Marc Gottlieb Creative Solutions
http://www.marcgottlieb.com
marc@marcgottlieb.com
(c) 2009. Released under the GPL. Made in Israel.

PersonalityQuiz is a PHP/MySQL personality quiz generator/knowledge tester. It allows the user to create an unlimited number of personality/knowledge test questionnaires and gather statistics on responses. This was designed with a specific client in mind, but since there is very little out there that's standalone, it is being offered to the community at large.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License Version 3 as published by the Free Software Foundation.

If this application suits your purposes, appreciation in the form of gratuities is welcome, and it will encourage further releases and feature enhancements. Please hit the tip jar via Paypal to marc@marcgottlieb.com.

Requires:
PHP 4.2+
MySQL 4.0+

Installation:
1) Create a database for your quiz tables.
2) Run the "simplequiz.sql" SQL script on your MySQL server to create tables and populate with a sample quiz
3) Upload the files to your server
4) Visit the site in your web browser
5) Visit /create.php to design your own quiz.

Version 1.0a
-Revamped codebase from Mongwell Easy Quiz Maker Version 1.3, a PHP/flatfile quiz maker (http://www.hotscripts.com/listing/mongwell-easy-quiz-maker/). With great appreciation to them for a starting point, even though this version looks very little like their code.

Currently there is no security on the front-end administration, but there is also no way to delete quizzes from the application.

Next Major Version Release TODO list
Administration 
Security
Delete/deprecate unwanted quizzes
Email administrator with result
Collect visitor email (optional)
Add questions/answers to existing quizzes
CSS
Web 2.0:
- # questions per page (1-all)
- jquery fade effects
- instant feedback on # respondants
Compatability correlation with other respondants(module?)
Internationalizeable
Scrub code
Database table prefixes

Future TODO:
Split form and function (template engine?)
Limit the number of answer choices per question (not 1 answer per personality) and assign answers to types (ease of use and greater response granularity)
PHP/MySQL simpler install (a la wordpress)
Personality strength (#answered/totalincategory)