# Introdução
Script que cria arquivos `*.id` das bases de dados do site clássico (`*.mst/*.xrf`) para serem usadas pelo módulo migration da aplicação Upload.

O script principal `./new_platform/script/start.sh` deve ser executado com a frequência que é feita a publicação no site clássico para manter os arquivos `*.id` atualizados para consumo da aplicação upload.

# Uso
Instalar a pasta **new_platform** no site clássico junto às pastas bases, bases-work, proc.
E execute os comandos:

Para garantir permissão de execução dos scripts

```console
chmod +x new_platform/script/*.sh
```

Para obter os arquivos esperados
```console
./new_platform/script/start.sh
```

Resultado da execução do comando
```
....
Create new_platform/bases_for_upload/title.id
Create new_platform/bases_for_upload/issue.id
Skip creating id files for serial folder. The new_platform/bases_for_upload/serial content will be ignored
....
....
Create script ./new_platform/tmp/create_bases_work_acron.sh
Create id files for bases-work/acron/acron
.......
Total bwho article pids
    4 new_platform/bases_for_upload/bwho/bwho.article_pids.csv
Total bwho article pids
    50 new_platform/bases_for_upload/csc/csc.article_pids.csv
Not found bases-work/sdeb/sdeb.mst
Not found bases-work/spm/spm.mst
....
Create id files for bases-work/artigo/p
....
....
Created id files
....
new_platform/bases_for_upload/title.id
new_platform/bases_for_upload/issue.id
new_platform/bases_for_upload/bases-work/medicc/medicc.id
new_platform/bases_for_upload/bases-work/artigo/p/0034-8910/1996/0005/00013.id

List the total article pids
    54 new_platform/bases_for_upload/article_pids.csv

You can backup or delete new_platform/bases_for_upload/serial. The current version of Upload does not use serial folder
```
