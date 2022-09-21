# TestAssignment - Tiago Azevedo

A UI and API Automation Tests project, made for the technical process of the interview.

## Technologies Used

This project requires:
- **Java JDK (11/17)**
- [Maven](https://maven.apache.org/install.html) - **Build Automation tool**
- [Jenkins](https://www.jenkins.io/doc/book/installing/) - **Open Source CI Automation Server**
- **IDE** of your choice - I used [IntelliJ](https://www.jetbrains.com/idea/download/#section=windows)
- [Karate](https://www.karatelabs.io/) - **Open Source Testing Framework**

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

Plugins needed:

- **Pipeline Maven Integration Plugin**

After installing [Jenkins](https://www.jenkins.io/doc/book/installing/), you are ready to create the pipeline to run the tests. This can be done in the following way:

1. Go to **Dashboard** > **New Item**
2. Choose **'Pipeline' Project** and give it a name
3. Check **'This project is parameterized'** and add two Boolean Parameters: one named **'UI'** and other **'API'**, both checking **'Set By Default'**.
4. In **'Pipeline' section - 'Pipeline script'** and add the script that is inside Jenkinsfile in the repository.

### Reports

After running the tests, reports are generated showing the results in the following formats - .xml .txt .json and .html. They will be located at ~*target/karate-reports* (for html and json-text) and *target/surefire-reports* (for xml results). Running the mvn clean command will delete the target folder before the test run.




