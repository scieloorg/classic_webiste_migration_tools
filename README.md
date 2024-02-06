# Introdução
Script que cria arquivos `*.id` das bases de dados do site clássico (`*.mst/*.xrf`) para serem usadas pelo módulo migration da aplicação Upload.

O script principal `./new_platform/script/start.sh` deve ser executado com a frequência que é feita a publicação no site clássico para manter os arquivos `*.id` atualizados para consumo da aplicação upload.

# Uso
Instalar a pasta new_platform no site clássico junto às pastas bases, bases-work, proc.
E execute os comandos:

Para garantir permissão de execução dos scripts

```console
> chmod +x new_platform/script/*.sh
```

Para obter os arquivos esperados
```console
> ./new_platform/script/start.sh
....
Create new_platform/bases_for_upload/title.id
Create new_platform/bases_for_upload/issue.id
Create script ./new_platform/tmp/script.sh
Create id files for bases-work/acron/acron
.......
Not found bases-work/aiss/aiss.mst
Not found bases-work/bwho/bwho.mst
Not found bases-work/csc/csc.mst
Not found bases-work/csp/csp.mst
Not found bases-work/gs/gs.mst
Not found bases-work/icse/icse.mst
Not found bases-work/physis/physis.mst
Not found bases-work/rbepid/rbepid.mst
Not found bases-work/rcsp/rcsp.mst
Not found bases-work/resp/resp.mst
Not found bases-work/ress/ress.mst
Not found bases-work/rpmesp/rpmesp.mst
Not found bases-work/rpsp/rpsp.mst
Not found bases-work/rsap/rsap.mst
Not found bases-work/rsp/rsp.mst
Not found bases-work/sausoc/sausoc.mst
Not found bases-work/scol/scol.mst
Not found bases-work/sdeb/sdeb.mst
Not found bases-work/spm/spm.mst
....
Created id files for bases-work/artigo/p
....
....
Created id files
....
new_platform/bases_for_upload/title.id
new_platform/bases_for_upload/issue.id
new_platform/bases_for_upload/bases-work/medicc/medicc.id
new_platform/bases_for_upload/bases-work/artigo/p/0034-8910/1996/0005/00013.id
```
