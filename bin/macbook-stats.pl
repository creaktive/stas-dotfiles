#!/usr/bin/env perl
%m=map{/Pages (free|active|inactive|wired down):\s*(\d+)/;(substr($1,0,1)=>$2<<12)}qx{vm_stat};delete$m{q{}};@l=split/\s+/,qx{uptime};@b=map{(/(\d+)$/)[0]}grep{/(Max|Current)Capacity/}qx{ioreg -l};printf qq{%s l:%s/%s/%s b:%.01f%%\n},(join q{ },map{sprintf q(%s:%0.2fG),$_,$m{$_}/(2**30)}sort keys%m),@l[-3..-1],100*$b[1]/$b[0]
