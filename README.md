# SQLitedatabase
group project for information management

Hoi iedereen, kdenk da het effectief makkelijker is om te werken met github (is overzichtelijker), zoals je kan zien is dit een README file, hier staat meestal een uitvoerige beschrijving van wat het project juist is. Ook denk ik dat het een enorm pluspunt (voor de cdt.) is als we een link naar deze github repository (plaats waar alles staat) in ons document staat. 

4.2.1. InformationManagement.jl ==> geeft error 
  normaal gezien om op te starten in browser het volgende ingeven:
    Main Page: http://localhost:8080/
    Page 1: http://localhost:8080/page1
    Page 2: http://localhost:8080/page2
    Page 3 with Table: http://localhost:8080/page3

Using GitHub for Collaboration:

  Create a GitHub Repository:
  One of you will need to create a new repository on GitHub.com. This will be the central location for storing your project files.
  Give your repository a descriptive name and a brief description of the project.
  Version Control with Git:
  While working on the database schema and queries, it's crucial to use a version control system like Git. Git allows you to track changes, collaborate with your    friends, and revert to previous versions if needed.
  If you're not familiar with Git, there are plenty of resources available online to learn the basics. Here's a helpful Git tutorial: https://git-scm.com/
  Here's a possible workflow using DB Browser for SQLite and Git:

  Create the Initial Schema: One person creates the initial database schema using DB Browser for SQLite.
  Export the Database File: Export the SQLite database file (.sqlite) from DB Browser for SQLite.
  Push the Database File to GitHub: Use Git commands to add the exported database file to the newly created GitHub repository. This creates a version history of     your database schema.
  Clone the Repository: Your friends can then clone the repository onto their machines. This will download the latest version of the database file.
  Making Changes: Everyone can use DB Browser for SQLite to make changes to the database schema locally.
  Committing and Pushing Changes: After making changes, each person commits their changes to their local Git repository and then pushes those changes to the main    repository on GitHub.
  
  Important Points:

  Conflict Resolution: If multiple people modify the same part of the schema simultaneously, Git might encounter conflicts. These conflicts need to be               resolved manually by merging the changes. There are tools and tutorials available to help with conflict resolution.
   Alternative Approach:
  While the above workflow uses the database file directly, an alternative approach is to keep the database schema definition as SQL code within the                 repository. This can be achieved by creating a script file (e.g., schema.sql) containing the CREATE TABLE statements for your database schema. You can then        use Git to track changes to this script file. This approach might be more flexible for complex projects.
