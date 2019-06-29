package com.codingkapoor.simplesbtproject

import java.io.File
import com.typesafe.config.{Config, ConfigFactory}
import scala.sys.SystemProperties

trait RuntimeEnvironment {
  private lazy val sp = new SystemProperties()

  private def getConfDir: String = {
    val vmParam = "conf.dir"
    val r = sp(vmParam)

    if (r != null && !r.trim.isEmpty) r.trim else throw new RuntimeException(s"-D$vmParam was not provided.")
  }

  private lazy val appConfFile = getConfDir + File.separator + "application.conf"
  lazy val appConf: Config = ConfigFactory.parseFile(new File(appConfFile))
}
