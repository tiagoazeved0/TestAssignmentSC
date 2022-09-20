package examples.runners;

import com.intuit.karate.junit5.Karate;

class APITestsRunner {

    @Karate.Test
    Karate testTags() {
        return Karate.run("classpath:examples/petstore").tags().relativeTo(getClass());
    }
}
