package mio.model;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class IdoruTest {
    @Test
    public void 아이도루테스트() {
        mio.model.Idoru idoru = new mio.model.Idoru();
        assertEquals("나 아이돌 그만둘래!", idoru.yameru());
    }
}
