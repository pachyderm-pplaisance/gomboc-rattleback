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
  implementation("org.apache.logging.log4j:log4j-core:2.14.1")
}
