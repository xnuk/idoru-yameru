# java -jar smali.jar -o classes.dex IdoruYameru.smali
# zip IdoruYameru.zip classes.dex
# adb push IdoruYameru.zip /data/local
# adb shell dalvikvm -cp /data/local/IdoruYameru.zip IdoruYameru

.class public LIdoruYameru;

.super Ljava/lang/Object;
.method public static main([Ljava/lang/String;)V
    .registers 2
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string	v1, "나 아이돌 그만둘래!"
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    return-void
.end method