7earth Subdomain Enumeration Tool 🕵️‍♂️

Welcome to the Subdomain Enumeration Tool! This is a handy, all-in-one Bash script designed to make subdomain discovery a breeze. Whether you're a penetration tester, bug bounty hunter, or just a curious security enthusiast, this tool will save you time by automating the boring stuff.

I built this because I got tired of running multiple tools manually and copy-pasting results. Now, everything is streamlined into one simple script. Let’s dive in!
What’s Inside the Toolbox? 🧰

This tool combines some of the best open-source subdomain enumeration tools out there:

    Sublist3r: For quick and dirty subdomain discovery.

    AssetFinder: Finds domains and subdomains like a charm.

    Amass: The heavyweight champion of DNS enumeration.

    SubFinder: Fast and reliable subdomain discovery.

    Findomain: Blazingly fast and cross-platform.

    MassDNS: A high-performance DNS resolver.

    AltDNS: Generates clever subdomain permutations.

All these tools work together to give you the most comprehensive results possible.
Getting Started 🚀
Prerequisites

Before you start, make sure you have:

    A Linux-based system (I recommend Ubuntu/Debian).

    Bash (it should be there by default, but just in case).

    An internet connection (to download the tools).

Installation

    Clone the repo:
    git clone https://github.com/yourusername/7earth_sub.git
    cd 7earth_sub

    Make the installer executable:
    chmod +x 7earth_sub.sh

    Run the installer:
    ./install_tools.sh

    This script will install all the tools and dependencies you need. Grab a coffee ☕—it might take a few minutes.

How to Use It 🛠️
Step 1: Run the Script

    Make the script executable:
    chmod +x 7earth_sub.sh

    Run it with your target domain:
    ./7earth_sub.sh example.com

    Replace example.com with the domain you want to enumerate.

Step 2: Check the Results

Once the script finishes, you’ll find a folder named subdomain_enumeration in the current directory. Inside, you’ll see:

    Individual results from each tool (e.g., sublist3r.txt, amass.txt, etc.).

    A consolidated file named all_subdomains.txt with all the subdomains combined and deduplicated.

Example Run 🖥️

Here’s what it looks like when you run the tool:
$ ./7earth_sub.sh example.com

Running Sublist3r... Done!
Running AssetFinder... Done!
Running Amass... Done!
Running SubFinder... Done!
Running Findomain... Done!
Running MassDNS... Done!
Running AltDNS... Done!

Subdomain enumeration completed! Results saved in all_subdomains.txt.

Why Use This Tool? 🤔

    Saves Time: No more running tools one by one.

    Comprehensive Results: Combines the strengths of multiple tools.

    Easy to Use: Just run one script and let it do the work.

    Customizable: Add or remove tools as you see fit.
