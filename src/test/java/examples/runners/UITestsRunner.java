package examples.runners;

import com.intuit.karate.junit5.Karate;

class UITestsRunner {

    @Karate.Test
    Karate testTags() {
        return Karate.run("classpath:examples/ui_playground").tags().relativeTo(getClass());
    }
}
