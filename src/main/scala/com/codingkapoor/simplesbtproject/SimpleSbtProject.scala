package com.codingkapoor.simplesbtproject

import com.typesafe.scalalogging.LazyLogging

object SimpleSbtProject extends App with LazyLogging with RuntimeEnvironment {
  logger.info(s"Configured interface = ${appConf.getConfig("simplesbtproject").getString("interface")}")
}
