package examples;

import com.intuit.karate.junit5.Karate;

class PlaygroundRunner {

    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@Playground").relativeTo(getClass());
    }
}
