import com.intuit.karate.junit5.Karate;

public class KarateRunnerTest {
    @Karate.Test
    Karate testAll(){
        return Karate.run("classpath:feature/miTest.feature");
    }
}