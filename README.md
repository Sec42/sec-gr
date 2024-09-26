Some lwr's pointing to current work

# Initial setup

    sudo apt-get install python3-pip
    sudo pip3 install pybombs
    sudo apt-get install ccache # optional

    pybombs auto-config
    pybombs recipes add-defaults
    pybombs recipes add sec-gr git+https://github.com/Sec42/sec-gr.git

# Create new prefix

    mkdir ~/GR
    cd ~/GR
    pybombs recipes update
    pybombs prefix init
    echo 'PATH=/usr/lib/ccache:${PATH}' >> setup_env.sh # optional
    source setup_env.sh
    cp ~/.pybombs/recipes/sec-gr/example-config.yml .pybombs/config.yml # edit to taste

# install / update things in a prefix

    cd ~/GR
    source setup_env.sh
    pybombs recipes update
    pybombs install soapyhackrf soapyrtlsdr # add more to taste
    pybombs install gnuradio
    pybombs install gr-iridium

## optional but recommended

    pybombs install gr-osmosdr # If your SDR needs osmosdr
    pybombs install gr-fosphor # for "osmocom_fft -F"
    pybombs install inspectrum # to look at recordings
    pybombs install limesuite  # if you have a limesdr

# Using it in a new terminal window:

    source ~/GR/setup_env.sh

now use all tools normally, for example:

    iridium-extractor ~/GR/src/gr-iridium/examples/hackrf.conf > test.bits
