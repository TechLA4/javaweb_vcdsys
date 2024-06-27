package vcd.system.service;

import java.io.File;
import java.nio.file.Path;

public interface DBService {


    boolean Backup();

    boolean recovery(Path tempFile);
}
