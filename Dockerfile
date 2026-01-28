FROM ubuntu:22.04

# تثبيت Icecast و Liquidsoap
RUN apt-get update && \
    apt-get install -y icecast2 liquidsoap wget && \
    apt-get clean

# نسخ ملفات الإعداد
COPY icecast.xml /etc/icecast2/icecast.xml
COPY radio.liq /radio.liq
COPY music/ /music/

# فتح البورت
EXPOSE 8000

# تشغيل Icecast و Liquidsoap
CMD service icecast2 start && liquidsoap /radio.liq
