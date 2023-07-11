# Taiwan 165 Anti-Fraud DNS Blocklist Generator

This project provides a concise shell script designed to fetch and process data from the [165 Anti-Fraud and Scam Reporting Center's open dataset][dataset]. The 165 Anti-Fraud and Scam Reporting Center is an official platform established by the National Police Agency, Ministry of the Interior, Republic of China (Taiwan). It offers a comprehensive range of services for the public to report and consult on various types of fraud cases, serving as a hub for the latest news updates on fraud cases, debunking scams-related rumors, and listing high-risk marketplaces.

This script translates the data on fraudulent investment websites collected by the center into a format compatible with DNS filtering systems such as Pi-Hole and AdGuard Home, enabling these systems to automatically block traffic to these fraudulent domains.

## Usage

To use the script and generate the blocklist, simply execute:

```shell
./generate_blocklist.sh
```

This command will download the latest dataset from the 165 Anti-Fraud and Scam Reporting Center and create a file named `fraud_domains.txt` containing the domains to be blocked.

If you want to manually download the dataset, the direct download link is here: <https://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=3BB8E3CE-8223-43AF-B1AB-5824FA889883>.

**Please note that the host server (data.moi.gov.tw) may restrict downloads from non-Taiwanese IP addresses.**

Subsequently, you can configure your DNS filtering software (like [Pi-Hole][Pi-Hole], [AdGuard Home][AdGuard Home], and [Blocky][Blocky]) to use `fraud_domains.txt` as a custom blocklist. For more threat blocklists, please refer to [threat-hostlist][threat-hostlist].

## Credits

The original list of fraudulent domains is provided by the [165 Anti-Fraud and Scam Reporting Center][165], a platform offered by the National Police Agency, Ministry of the Interior, Republic of China (Taiwan). The raw data is accessible on the [Taiwan open data portal][dataset]. This script is a handy tool that automates the process of downloading and converting the dataset into a DNS blocklist format.

## Disclaimer

This blocklist is shared as-is, aiming to support the community in its efforts to maintain economic security and safeguard people's assets in Taiwan. Please use it at your own risk. We provide no guarantees regarding the accuracy or completeness of the domain list.

[dataset]: https://data.gov.tw/en/datasets/160055
[165]: https://165.npa.gov.tw/

[Pi-Hole]: https://pi-hole.net/
[AdGuard Home]: https://github.com/AdguardTeam/AdguardHome
[Blocky]: https://0xerr0r.github.io/blocky
[threat-hostlist]: https://github.com/PeterDaveHello/threat-hostlist
