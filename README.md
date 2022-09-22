# TestAssignment - Tiago Azevedo

A UI and API Automation Tests project made with Java and Karate.

## Technologies Used

This project requires:
- **Java JDK (versions [11](https://adoptium.net/temurin/releases/?version=11) or [17](https://adoptium.net/temurin/releases/?version=17))**
- [Maven](https://maven.apache.org/install.html) - **Build Automation tool**
- [Jenkins](https://www.jenkins.io/doc/book/installing/) - **Open Source CI Automation Server**
- **IDE** of your choice
- [Karate](https://www.karatelabs.io/) - **Open Source Testing Framework** *(The mvn command will install this dependency)*

## Setup

Clone this repository to a new directory, using the following command:

```bash
git clone https://github.com/tiagoazeved0/TestAssignmentSC.git
```

### Running Locally

Inside the directory, use the following commands: 

#### For API Testing only


```bash
mvn clean test -Dtest=APITestsRunner
```

#### For UI Testing only

```bash
mvn clean test -Dtest=UITestsRunner
```

#### For both UI and API Testing

```bash
mvn clean test -Dtest=AllFeaturesRunner
```

### Running on Jenkins

After installing [Jenkins](https://www.jenkins.io/doc/book/installing/) and the suggested plugins in the initial Jenkins setup, you should be ready to create the pipeline to run the tests. This can be done in the following way:

1. Go to **Dashboard** > **New Item**
2. Choose **'Pipeline' Project** and give it a name
3. Check **'This project is parameterized'** and add two Boolean Parameters: one named **'UI'** and the other **'API'**, both checking **' Set By Default'**.
4. In **'Pipeline'** section - Choose **'Pipeline script'** and add the script that is inside Jenkinsfile in the repository.

## Reports

After running the tests, reports will be generated with the results in the following formats - **.xml .txt .json** and **.html**. They are located at ~*target/karate-reports* *(for html and json-text)* and *target/surefire-reports* *(for xml results)*. Running the **mvn clean** command will **delete the target folder before the test runner execution**.

You can also check the results uploaded in Calliope.Pro: [Report](https://app.calliope.pro/reports/148239/public/ed7bbdad-a507-4816-a966-2d87870e6d08)

### Improvements and Features Feedback

**Improvements**
- The login and register pages should have elements in UI that make them more distinct from each other.
- On Reports Page, you should be able to select more than one report at the same time, in order to perform the same action for reports you select.
- More documentation for Windows and Mac Users, with code examples.

**Features**
- Integration with Github, to manage the test scripts and publish them in Calliope.
- Integration with Jenkins through a plugin, that allows for an easier setup of a post-stage of the reports to the Calliope profile.

## Tech Assignment Development Feedback

- My initial development process was working with Selenium and Cucumber, as those are the main technologies I have working with these past years. After reading documentation and articles about available Automation Testing tools for API testing, I came across **Karate** and how it has **API test-automation, mocks, performance-testing and UI Automation** as a single framework. As a learning process and a challenge for myself, I decided to migrate my code to Karate and use it as my main framework for this project.

- For UI tests, the idea was to see the capabilities of Karate as an UI Automation Tool and what I could achieve in just a few days of learning it from scratch. I managed to get the same results as I was getting with Selenium and Cucumber, but in a much faster and easier way of developing those tests, as well as documenting its results *(important to mention that I have added the sleep() behavior between steps to visually verify the automation being done correctly)*.
- For API tests, I found Karate to have a much simpler syntax while describing the correct flows of the requests and responses, as well as the assertions to verify if the behavior is the intended one.

- In my point of view, all scenarios were important to be comfortable with this technology, as well as reusing them for various other features. I have noted that, in some test cases, some behaviors of the Petstore Swagger API aren't ideal. *(e.g. being able to set IDs manually, as well as sending them in different data types)*

- The next step of this project will be the integration of the Jenkins Pipeline with Calliope.pro, improvements in generated reports, UI Tests with cross-browser compatibility, UI DOM Manipulation automated for assertions.

*Tiago Azevedo, 2022*
