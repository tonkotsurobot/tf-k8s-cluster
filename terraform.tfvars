vsphere_datacenter = "DC"
vsphere_cluster = "HOME"

control  = [
    {
        hostname = "k8s-control-1"
        CPU_Count = "2"
        RAM = "2048"
        ip = "192.168.1.70"
    } ,
    {
        hostname = "k8s-control-2"
        CPU_Count = "2"
        RAM = "2048"
        ip = "192.168.1.71"
    }
]

worker  = [
    {
        hostname = "k8s-data-1"
        CPU_Count = "3"
        RAM = "4096"
        ip = "192.168.1.72"
    },
    {
        hostname = "k8s-data-2"
        CPU_Count = "3"
        RAM = "4096"
        ip = "192.168.1.73"
    },
    {
        hostname = "k8s-data-3"
        CPU_Count = "3"
        RAM = "4096"
        ip = "192.168.1.74"
    }
]
