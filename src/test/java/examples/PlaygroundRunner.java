package examples;

import com.intuit.karate.junit5.Karate;

class PlaygroundRunner {

    @Karate.Test
    Karate testTags() {
        return Karate.run("classpath:examples/ui_playground").tags().relativeTo(getClass());
    }
}
