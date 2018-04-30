package mio.model;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class IdoruTest {

    private Idoru idoru;

    @Before
    public void setUp() throws Exception {
        idoru = new Idoru();
    }

    @Test
    public void 관객수확인_30() {
        idoru.addViewer(Audience.of(30));
        assertFalse(idoru.checkAudienceCount());
    }

    @Test
    public void 관객수확인_100() {
        idoru.addViewer(Audience.of(100));
        assertTrue(idoru.checkAudienceCount());
    }

    @Test
    public void 아이돌그만두기() {
        idoru.addViewer(Audience.of(10));
        assertEquals("관객이 적잖아! 나 아이돌 그만둘래!",
                idoru.yameru());
    }

    @Test
    public void 아이돌그만두지않기() {
        idoru.addViewer(Audience.of(1000));
        assertEquals("고마워, 프로듀서. 아이돌, 그만두지 않아서 다행이야!",
                idoru.yameru());
    }
}
