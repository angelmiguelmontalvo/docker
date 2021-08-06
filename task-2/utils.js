const moment = require('moment');
const os = require('os');
const SystemInformation = require('systeminformation');

require('moment-timezone');

const checkInterface = (networkInterface) => {
    return networkInterface &&
    (networkInterface.ifaceName === 'eth0' && networkInterface.ip4);
};

const ipv4 = async () => {
    const result = await SystemInformation.networkInterfaces();
    const networkInterface = result.find(checkInterface);
    return networkInterface ? networkInterface.ip4 : '127.0.0.1';
};

const execute = async () => {
    return {
        time: moment().format('HH:mm:ss'),
        date: moment().format('DD-MM-YYYY'),
        timeZone: moment.tz.guess(),
        hostname: os.hostname(),
        ipAddress: await ipv4()
    };
};

execute();

module.exports = execute;
