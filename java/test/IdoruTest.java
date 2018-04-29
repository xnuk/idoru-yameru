package test;

import org.junit.Test;
import src.Idoru;

import static org.junit.Assert.assertEquals;

public class IdoruTest {
    @Test
    public void 아이도루테스트() {
        Idoru idoru = new Idoru();
        assertEquals("나 아이돌 그만둘래!", idoru.forgive());
    }
}
