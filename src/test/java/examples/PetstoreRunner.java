package examples;

import com.intuit.karate.junit5.Karate;

class PetstoreRunner {

    @Karate.Test
    Karate testTags() {
        return Karate.run("classpath:examples/petstore").tags().relativeTo(getClass());
    }
}
