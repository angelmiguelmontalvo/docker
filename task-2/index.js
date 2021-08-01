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
    console.info('Time: ', moment().format('HH:mm:ss'));
    console.info('Data: ', moment().format('DD-MM-YYYY'))
    console.info('Time zone:', moment.tz.guess());
    console.info('hostname:', os.hostname());
    console.info('Ip address:', await ipv4());
};

execute();



