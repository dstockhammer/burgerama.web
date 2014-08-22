library burgerama_web;

import 'package:angular/application_factory.dart';
import 'package:di/di.dart';
import 'package:logging/logging.dart';
import 'package:burgerama/burgerama.dart';

main(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord log) {
    print(log.message);
  });

  applicationFactory()
    ..addModule(new BurgeramaApp())
    ..run();
}
