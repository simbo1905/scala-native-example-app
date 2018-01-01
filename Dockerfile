FROM fedora:26
RUN dnf install -y llvm clang libunwind-devel gc-devel zlib-devel re2-devel curl
RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo
RUN yum install -y sbt git java-1.8.0-openjdk
RUN git clone https://github.com/lihaoyi/scala-native-example-app.git ; cd scala-native-example-app ; sbt version
RUN cd scala-native-example-app ; sbt nativeLink
CMD ./target/scala-2.11/scala-native-example-app-out
