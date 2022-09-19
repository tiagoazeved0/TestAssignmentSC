package examples.petstore;

import com.intuit.karate.junit5.Karate;

class FeaturesRunner {

    @Karate.Test
    Karate testPets() {
        return Karate.run("Feature1_CreatePetFlow").relativeTo(getClass());
    }

}
