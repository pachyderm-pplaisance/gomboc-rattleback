plugins {
  java
}

java {
  sourceCompatibility = JavaVersion.VERSION_1_8
}

repositories {
  mavenCentral()
}

dependencies {
  implementation("org.springframework.boot:spring-boot-starter-logging:2.6.1")
}
