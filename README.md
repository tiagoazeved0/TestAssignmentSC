# TestAssignment - Tiago Azevedo

A UI and API Automation Tests project, made for the technical process of the interview.

## Technologies Used

This project requires:
- Java JDK (8 or higher)
- [Maven](https://maven.apache.org/install.html) - Build Automation tool
- [Jenkins](https://www.jenkins.io/doc/book/installing/) - Open Source CI Automation Server
- IDE of your choice - I used [IntelliJ](https://www.jetbrains.com/idea/download/#section=windows)

## Setup

1. Clone this repository to a new directory, using the following command:

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


