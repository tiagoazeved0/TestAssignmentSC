package examples.runners;

import com.intuit.karate.junit5.Karate;

class AllFeaturesRunner {

    @Karate.Test
    Karate testTags() {
        return Karate.run("classpath:examples/").tags().relativeTo(getClass());
    }
}
