package examples.petstore.pet;

import com.intuit.karate.junit5.Karate;

class PetsRunner {

    @Karate.Test
    Karate testPets() {
        return Karate.run("pet").relativeTo(getClass());
    }

}
