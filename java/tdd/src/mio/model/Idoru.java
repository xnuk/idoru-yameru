package mio.model;

public class Idoru {
    private static final String NO_YAMERU_MSG = "고마워, 프로듀서. 아이돌, 그만두지 않아서 다행이야!";
    private static final String YEMERU_MSG = "관객이 적잖아! 나 아이돌 그만둘래!";
    private Audience audience;

    public String yameru() {
        // TODO 추후에 optional 이나 널오브젝트 패턴 등을 적용해보도록 한다
        if (audience == null) {
            throw new RuntimeException("관객을 먼저 추가해야 합니다");
        }

        if (checkAudienceCount()) {
            return NO_YAMERU_MSG;
        }

        return YEMERU_MSG;
    }

    public void addViewer(Audience audience) {
        this.audience = audience;
    }

    boolean checkAudienceCount() {
        if (audience.checkCountOver100()) {
            return true;
        }

        return false;
    }
}
