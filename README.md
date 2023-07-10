# Taiwan 165 Anti-Fraud DNS Blocklist Generator

This project provides a concise shell script designed to fetch and process data from the [165 Anti-Fraud and Scam Reporting Center's open dataset][dataset]. The 165 Anti-Fraud and Scam Reporting Center is an official platform established by the National Police Agency, Ministry of the Interior, Republic of China (Taiwan). It offers a comprehensive range of services for the public to report and consult on various types of fraud cases, serving as a hub for the latest news updates on fraud cases, debunking scams-related rumors, and listing high-risk marketplaces.

This script translates the data on fraudulent investment websites collected by the center into a format compatible with DNS filtering systems such as Pi-Hole and AdGuard Home, enabling these systems to automatically block traffic to these fraudulent domains.

## Usage

To use the script and generate the blocklist, simply execute:

```shell
./generate_blocklist.sh
```

This command will download the latest dataset from the 165 Anti-Fraud and Scam Reporting Center and create a file named `fraud_domains.txt` containing the domains to be blocked.

Subsequently, you can configure your DNS filtering software (like Pi-Hole or AdGuard Home) to use `fraud_domains.txt` as a custom blocklist.

## Credits

The original list of fraudulent domains is provided by the [165 Anti-Fraud and Scam Reporting Center][hotline], a platform offered by the National Police Agency, Ministry of the Interior, Republic of China (Taiwan). The raw data is accessible on the [Taiwan open data portal][dataset]. This script is a handy tool that automates the process of downloading and converting the dataset into a DNS blocklist format.

## Disclaimer

This blocklist is shared as-is, aiming to support the community in its efforts to maintain economic security and safeguard people's assets in Taiwan. Please use it at your own risk. We provide no guarantees regarding the accuracy or completeness of the domain list.

[dataset]: https://data.gov.tw/en/datasets/160055
[hotline]: https://165.npa.gov.tw/
