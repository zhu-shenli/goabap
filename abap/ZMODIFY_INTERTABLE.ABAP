REPORT zmodify_intertable.

*DATA : BEGIN OF hah,
*
*        flag TYPE c,
*        sex TYPE c,
*END OF hah.
*DATA it_hah like TABLE OF hah.
*CLEAR hah.
*hah-flag = 'X'.
*hah-sex = 'f'.
*APPEND hah to  it_hah.
*CLEAR hah.
*hah-sex = 'm'.
*APPEND hah to  it_hah.
*CLEAR hah.
*hah-sex = 'm'.
*APPEND hah to  it_hah.
*CLEAR hah.
*hah-sex = 'm'.
*APPEND hah to  it_hah.
*LOOP AT it_hah INTO hah.
*  WRITE :/ hah-flag,' ',hah-sex.
*ENDLOOP.


*
*DATA : BEGIN OF hah,
*        flag TYPE c,
*        sex TYPE c,
*       END OF hah.
*DATA it_hah like TABLE OF hah.
*CLEAR hah.
*hah-flag = 'X'.
*hah-sex = 'f'.
*APPEND hah to  it_hah.
*CLEAR hah.
*hah-sex = 'm'.
*APPEND hah to  it_hah.
*CLEAR hah.
*hah-sex = 'm'.
*APPEND hah to  it_hah.
*CLEAR hah.
*hah-sex = 'm'.
*APPEND hah to  it_hah.
*
*LOOP AT it_hah INTO hah.
*  WRITE :/ hah-flag,' ',hah-sex.
*ENDLOOP.
*
*
*LOOP AT it_hah INTO hah.
*  IF hah-flag is INITIAL.
*    hah-flag = 'x'.
*  ENDIF.
*  MODIFY it_hah FROM hah.
*ENDLOOP.
*
*LOOP AT it_hah INTO hah.
*  WRITE :/ hah-flag,' ',hah-sex.
*ENDLOOP.





DATA : BEGIN OF hah,
       flag TYPE c,
       sex(2) TYPE c,
      END OF hah.
DATA it_hah LIKE TABLE OF hah.
CLEAR hah.
hah-flag = 'X'.
hah-sex = 'f'.
APPEND hah TO  it_hah.
CLEAR hah.
hah-sex = 'm'.
APPEND hah TO  it_hah.
CLEAR hah.
hah-sex = 'm'.
APPEND hah TO  it_hah.
CLEAR hah.
hah-sex = 'm'.
APPEND hah TO  it_hah.
"****************这里***************

hah-flag = 'x'.
MODIFY it_hah FROM hah TRANSPORTING flag WHERE flag IS INITIAL.

"***************************
LOOP AT it_hah INTO hah.
  WRITE :/ hah-flag,' ',hah-sex.
ENDLOOP.


DATA: BEGIN OF ha,
  a TYPE c,
  b TYPE c,
  END OF ha.

DATA it_ha LIKE TABLE OF ha.
CLEAR ha.

ha-a = 'm'.
ha-b = '男'.
APPEND ha TO it_ha.

CLEAR ha.
ha-a = 'f'.
ha-b = '女'.
APPEND ha TO it_ha.

CLEAR ha.


"SORT it_hah BY sex DESCENDING.

"循环读取内表后,然后按索引读取另一内表
*loop at it_ha into ha.
**  READ TABLE it_hah into hah index sy-tabix.
**  if hah-sex = ha-a.
**    hah-sex = ha-b.
**    modify it_hah from hah index sy-tabix TRANSPORTING sex.
**    ENDIF.
*  read TABLE it_hah into hah index sy-tabix.
*  if hah-sex = ha-a.
*    hah-sex = ha-b.
*  modify it_hah from hah index sy-tabix TRANSPORTING sex." where sex = ha-a.
*  ENDIF.
*
*
*
*  ENDLOOP.



"//read table不是循环而是按照顺序读取内表.
*READ TABLE it_hah INTO hah INDEX sy-tabix.
*LOOP AT it_ha INTO ha.
*  IF hah-sex = ha-a.
*    hah-sex = ha-b.
*    MODIFY it_hah FROM hah INDEX sy-tabix TRANSPORTING sex.
*  ENDIF.
*
*ENDLOOP.



"//双loop,循环读取内表并实现替代,逐行
*loop at it_hah into hah.
*loop at it_ha into ha.
*  if hah-sex = ha-a.
*    hah-sex = ha-b.
*    modify it_hah from hah TRANSPORTING sex.
*  ENDIF.
*  endloop.
*
*
*ENDLOOP.

"和上述一致,逐行替代
*loop at it_ha into ha.
*loop at it_hah into hah.
*  if hah-sex = ha-a.
*    hah-sex = ha-b.
*    modify it_hah from hah TRANSPORTING sex.
*  ENDIF.
*  endloop.
*
*
*ENDLOOP.




"写到最后如上就是一坨屎山一样的代码,如下就精简的不能再精简了!
"按照条件替换
loop at it_ha into ha.
  hah-sex = ha-b.
  modify it_hah from hah TRANSPORTING sex where sex = ha-a.
  ENDLOOP.




LOOP AT it_hah INTO hah.
WRITE :/ hah-flag,' ',hah-sex.
ENDLOOP.