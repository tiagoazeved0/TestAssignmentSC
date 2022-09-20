package examples.ui_playground;

import com.intuit.karate.junit5.Karate;

class UIRunner {

    @Karate.Test
    Karate testUI_Playground() {
        return Karate.run().relativeTo(getClass());
    }

}
