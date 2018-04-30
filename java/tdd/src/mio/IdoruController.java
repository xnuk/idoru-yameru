package mio;

import mio.model.Idoru;
import mio.model.Audience;

public class IdoruController {
    public static void main(String[] args) {
        Idoru idoru = new Idoru();
        idoru.addViewer(Audience.of(1));
        // 여기 관객 단 한명!

        System.out.println(idoru.yameru());
    }
}
