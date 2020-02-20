```mysql
#show engine innodb status output:

=====================================
2019-10-18 11:56:39 0x7fcaeddfa700 INNODB MONITOR OUTPUT
=====================================
Per second averages calculated from the last 36 seconds
-----------------
BACKGROUND THREAD
-----------------
srv_master_thread loops: 1378 srv_active, 0 srv_shutdown, 232547 srv_idle
srv_master_thread log flush and writes: 233912
----------
SEMAPHORES
----------
OS WAIT ARRAY INFO: reservation count 3304
OS WAIT ARRAY INFO: signal count 5362
RW-shared spins 0, rounds 7080, OS waits 3056
RW-excl spins 0, rounds 1569, OS waits 176
RW-sx spins 0, rounds 0, OS waits 0
Spin rounds per wait: 7080.00 RW-shared, 1569.00 RW-excl, 0.00 RW-sx
------------
TRANSACTIONS
------------
Trx id counter 51635
Purge done for trx's n:o < 51635 undo n:o < 0 state: running but idle
History list length 20
LIST OF TRANSACTIONS FOR EACH SESSION:
---TRANSACTION 421985423834736, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423844768, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423872128, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423868480, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423865744, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423863920, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423863008, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423860272, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423859360, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423857536, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423856624, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423855712, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423854800, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423846592, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423843856, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423841120, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423833824, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423853888, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423852976, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423852064, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423851152, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423850240, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423849328, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423848416, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423847504, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423845680, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423842944, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423842032, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423840208, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423839296, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423838384, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423837472, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423835648, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423832912, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423836560, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
---TRANSACTION 421985423864832, not started
0 lock struct(s), heap size 1136, 0 row lock(s)
--------
FILE I/O
--------
I/O thread 0 state: waiting for completed aio requests (insert buffer thread)
I/O thread 1 state: waiting for completed aio requests (log thread)
I/O thread 2 state: waiting for completed aio requests (read thread)
I/O thread 3 state: waiting for completed aio requests (read thread)
I/O thread 4 state: waiting for completed aio requests (read thread)
I/O thread 5 state: waiting for completed aio requests (read thread)
I/O thread 6 state: waiting for completed aio requests (write thread)
I/O thread 7 state: waiting for completed aio requests (write thread)
I/O thread 8 state: waiting for completed aio requests (write thread)
I/O thread 9 state: waiting for completed aio requests (write thread)
Pending normal aio reads: [0, 0, 0, 0] , aio writes: [0, 0, 0, 0] ,
 ibuf aio reads:, log i/o's:, sync i/o's:
Pending flushes (fsync) log: 0; buffer pool: 0
12265 OS file reads, 49491 OS file writes, 28853 OS fsyncs
0.00 reads/s, 0 avg bytes/read, 0.56 writes/s, 0.44 fsyncs/s
-------------------------------------
INSERT BUFFER AND ADAPTIVE HASH INDEX
-------------------------------------
Ibuf: size 1, free list len 0, seg size 2, 8 merges
merged operations:
 insert 5, delete mark 3, delete 0
discarded operations:
 insert 0, delete mark 0, delete 0
Hash table size 34673, node heap has 268 buffer(s)
Hash table size 34673, node heap has 153 buffer(s)
Hash table size 34673, node heap has 50 buffer(s)
Hash table size 34673, node heap has 3 buffer(s)
Hash table size 34673, node heap has 156 buffer(s)
Hash table size 34673, node heap has 175 buffer(s)
Hash table size 34673, node heap has 178 buffer(s)
Hash table size 34673, node heap has 1 buffer(s)
0.22 hash searches/s, 1.36 non-hash searches/s
---
LOG
---
Log sequence number 190607019
Log flushed up to   190607019
Pages flushed up to 190607019
Last checkpoint at  190607010
0 pending log flushes, 0 pending chkp writes
22869 log i/o's done, 0.28 log i/o's/second
----------------------
BUFFER POOL AND MEMORY
----------------------
Total large memory allocated 137428992
Dictionary memory allocated 801311
Buffer pool size   8191
Free buffers       1024
Database pages     6183
Old database pages 2262
Modified db pages  0
Pending reads      0
Pending writes: LRU 0, flush list 0, single page 0
Pages made young 71118, not young 2942807
0.00 youngs/s, 0.00 non-youngs/s
Pages read 12138, created 2525, written 24685
0.00 reads/s, 0.00 creates/s, 0.22 writes/s
Buffer pool hit rate 1000 / 1000, young-making rate 0 / 1000 not 0 / 1000
Pages read ahead 0.00/s, evicted without access 0.00/s, Random read ahead 0.00/s
LRU len: 6183, unzip_LRU len: 0
I/O sum[8]:cur[0], unzip sum[0]:cur[0]
--------------
ROW OPERATIONS
--------------
0 queries inside InnoDB, 0 queries in queue
0 read views open inside InnoDB
Process ID=1147, Main thread ID=140510147086080, state: sleeping
Number of rows inserted 809834, updated 8929, deleted 2951, read 126836021
0.00 inserts/s, 0.08 updates/s, 0.00 deletes/s, 1.83 reads/s
----------------------------
END OF INNODB MONITOR OUTPUT
============================

```

