SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `shares` (
 `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
 `job_id` varchar(255) NOT NULL,
 `pow_hash` varchar(255) NOT NULL,
 `mix_digest` varchar(255) NOT NULL,
 `response` varchar(255) NOT NULL,
 `nonce` bigint(20) unsigned NOT NULL,
 `diff` bigint(20) unsigned NOT NULL,
 `network_diff` bigint(20) unsigned NOT NULL,
 `height` bigint(20) unsigned NOT NULL,
 `timestamp` bigint(20) unsigned NOT NULL,
 `ip` varchar(255) NOT NULL,
 `port` smallint(5) unsigned NOT NULL,
 `miner_fullname` varchar(255) NOT NULL,
 `miner_wallet` varchar(255) NOT NULL,
 `miner_user` varchar(255) NOT NULL,
 `miner_worker` varchar(255) NOT NULL,
 `miner_pwd` varchar(255) NOT NULL,
 `pool_name` varchar(255) NOT NULL,
 `pool_url` varchar(255) NOT NULL,
 `pool_user` varchar(255) NOT NULL,
 `pool_worker` varchar(255) NOT NULL,
 `pool_pwd` varchar(255) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `pool_resp_time` (`pool_name`(191),`response`(191),`timestamp`),
 KEY `pool_time` (`pool_name`(191),`timestamp`) USING BTREE,
 KEY `timestamp` (`timestamp`),
 KEY `pool_name` (`pool_name`(191)),
 KEY `response` (`response`(191)),
 KEY `height` (`height`),
 KEY `height_time` (`height`,`timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `blocks` (
 `height` bigint(20) unsigned NOT NULL,
 `hash` char(66) NOT NULL,
 `time` bigint(20) unsigned NOT NULL,
 `diff` bigint(20) unsigned NOT NULL,
 `gas_limit` bigint(20) unsigned NOT NULL,
 `gas_used` bigint(20) unsigned NOT NULL,
 `nonce` bigint(20) unsigned NOT NULL,
 PRIMARY KEY (`height`),
 KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

CREATE VIEW `nearblocks` AS SELECT
`t1`.`height` AS `height`,
`t1`.`time` AS `currtime`,
`t2`.`time` AS `nexttime`
FROM (`blocks` `t1` JOIN `blocks` `t2`)
WHERE ((`t1`.`height` + 1) = `t2`.`height`);

COMMIT;
