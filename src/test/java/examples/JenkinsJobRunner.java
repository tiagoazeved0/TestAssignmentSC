package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.job.MavenChromeJobConfig;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class JenkinsJobRunner {

    @Test
    void testAll() {
        MavenChromeJobConfig config = new MavenChromeJobConfig(0, "karate", 9080);
        Results results = Runner.path().tags("@Pets")
                .outputJunitXml(true)
                .timeoutMinutes(5).jobManager(config);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}