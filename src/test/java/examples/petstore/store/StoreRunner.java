package examples.petstore.store;

import com.intuit.karate.junit5.Karate;

class StoreRunner {

    @Karate.Test
    Karate testStores() {
        return Karate.run("store").relativeTo(getClass());
    }

}
